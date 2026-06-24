struct Layer1 {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
}

struct Layer2 {
    l1a: Layer1;
    l1b: Layer1;
    l1c: Layer1;
}

struct Layer3 {
    l2x: Layer2;
    l2y: Layer2;
}

contract Test {
    storage: Layer3;
    init() {
        self.storage = Layer3{
            l2x: Layer2{
                l1a: Layer1{f1:1,f2:2,f3:3,f4:4,f5:5},
                l1b: Layer1{f1:6,f2:7,f3:8,f4:9,f5:10},
                l1c: Layer1{f1:11,f2:12,f3:13,f4:14,f5:15}
            },
            l2y: Layer2{
                l1a: Layer1{f1:16,f2:17,f3:18,f4:19,f5:20},
                l1b: Layer1{f1:21,f2:22,f3:23,f4:24,f5:25},
                l1c: Layer1{f1:26,f2:27,f3:28,f4:29,f5:30}
            }
        };
    }
}