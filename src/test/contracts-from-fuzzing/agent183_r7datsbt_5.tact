struct SmallStruct {
    a: Int;
}

struct ParentStruct {
    val1: SmallStruct;
    val2: SmallStruct;
    val3: SmallStruct;
    val4: SmallStruct;
    val5: SmallStruct;
    val6: SmallStruct;
    val7: SmallStruct;
    val8: SmallStruct;
    val9: SmallStruct;
    val10: SmallStruct;
}

contract ManyNestedFields {
    data: ParentStruct = ParentStruct{
        val1: SmallStruct{a:1}, val2: SmallStruct{a:2}, val3: SmallStruct{a:3}, val4: SmallStruct{a:4}, val5: SmallStruct{a:5},
        val6: SmallStruct{a:6}, val7: SmallStruct{a:7}, val8: SmallStruct{a:8}, val9: SmallStruct{a:9}, val10: SmallStruct{a:10},
    };

    init() {
        self.data = ParentStruct{
            val1: SmallStruct{a:11}, val2: SmallStruct{a:12}, val3: SmallStruct{a:13}, val4: SmallStruct{a:14}, val5: SmallStruct{a:15},
            val6: SmallStruct{a:16}, val7: SmallStruct{a:17}, val8: SmallStruct{a:18}, val9: SmallStruct{a:19}, val10: SmallStruct{a:20},
        };
    }
}