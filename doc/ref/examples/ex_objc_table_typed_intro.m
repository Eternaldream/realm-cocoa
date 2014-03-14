/* @@Example: ex_objc_table_typed_intro @@ */

#import <Tightdb/Tightdb.h>


/* Defines a new table with two columns Name and Age. */

TIGHTDB_TABLE_2(PeopleTable,
                Name, String,
                Age, Int)


int main()
{
    @autoreleasepool {

        /* Creates a new table of the type defined above. */

        PeopleTable *table = [[PeopleTable alloc] init];

        PeopleTable_Cursor *cursor = [table addEmptyRow];
        cursor.Name = @"Brian";
        cursor.Age = 10;

        cursor = [table addEmptyRow];
        cursor.Name = @"Sofie";
        cursor.Age = 40;

/*
        [table addOrInsertRowAtIndex:[table count]
                                Name:@"Jesper"
                                 Age:200];
*/
        cursor = [table addEmptyRow];
        cursor.Name = @"Jesper";
        cursor.Age = 200;

        NSLog(@"The size of the table is now %zd", table.rowCount);

        for (PeopleTable_Cursor *ite in table) {
            NSLog(@"Name: %@ Age: %lli", ite.Name, ite.Age);
        }

        NSLog(@"Insert a new row");

        cursor = [table insertEmptyRowAtIndex:1];
        cursor.Name = @"Sam"; cursor.Age = 30;

        for (PeopleTable_Cursor *ite in table) {
            NSLog(@"Name: %@ Age: %lli", ite.Name, ite.Age);
        }

        TightdbCursor *c2 = [table cursorAtIndex:table.rowCount-1];
        if (c2 != nil)
            NSLog(@"Last row");

        TightdbCursor *c3 = [table cursorAtIndex:table.rowCount];
        if (c3 != nil)
            NSLog(@"Should not get here.");
    }
}

/* @@EndExample@@ */
