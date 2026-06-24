struct X1 { f0: Int; f1: Int; f2: Int; }
struct X2 { f0: X1; f1: X1; }
struct X3 { f0: X2; f1: X2; }
struct X4 { f0: X3; f1: X3; }

contract WideDeepNested {
    data: X4;

    init() {
        self.data = X4{
            f0: X3{
                f0: X2{f0:X1{f0:1,f1:2,f2:3}, f1:X1{f0:4,f1:5,f2:6}},
                f1: X2{f0:X1{f0:7,f1:8,f2:9}, f1:X1{f0:10,f1:11,f2:12}}
            },
            f1: X3{
                f0: X2{f0:X1{f0:13,f1:14,f2:15}, f1:X1{f0:16,f1:17,f2:18}},
                f1: X2{f0:X1{f0:19,f1:20,f2:21}, f1:X1{f0:22,f1:23,f2:24}}
            }
        };
    }
}