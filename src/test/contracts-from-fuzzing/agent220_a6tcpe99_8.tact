struct BigStruct {
    v1: Int = 1;
    v2: Int = 2;
    v3: Int = 3;
    v4: Int = 4;
    v5: Int = 5;
    v6: Int = 6;
    v7: Int = 7;
    v8: Int = 8;
    v9: Int = 9;
    v10: Int = 10;
}

contract InitPartOverride {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            v2: 200,
            v5: 500,
            v8: 800
        };
    }

    receive() {}
}