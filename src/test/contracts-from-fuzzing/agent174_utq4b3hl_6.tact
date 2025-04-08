struct Arr { v1: Int; v2: Int; v3: Int; v4: Int; v5: Int; v6: Int; v7: Int; v8: Int; v9: Int; v10: Int; }

contract BigStructVar {
    arr: Arr;
    
    init() {
        self.arr = Arr{
            v1: 1, v2: 2, v3: 3, v4: 4, v5:5,
            v6:6, v7:7, v8:8, v9:9, v10:10
        };
    }
}