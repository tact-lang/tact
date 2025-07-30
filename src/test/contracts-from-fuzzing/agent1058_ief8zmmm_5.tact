struct FiveInts {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract BigArrayFields {
    item1: FiveInts;
    item2: FiveInts;
    item3: FiveInts;
    item4: FiveInts;

    init() {
        self.item1 = FiveInts{a:1,b:2,c:3,d:4,e:5};
        self.item2 = FiveInts{a:6,b:7,c:8,d:9,e:10};
        self.item3 = FiveInts{a:11,b:12,c:13,d:14,e:15};
        self.item4 = FiveInts{a:16,b:17,c:18,d:19,e:20};
    }
}