struct Levels4 {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

struct Levels3 {
    a: Levels4;
    b: Levels4;
}

struct Levels2 {
    a: Levels3;
    b: Levels3;
}

struct Levels1 {
    a: Levels2;
    b: Levels2;
}

contract VeryDeepNested {
    val: Levels1;
    
    init() {
        self.val = Levels1{
            a: Levels2{
                a: Levels3{
                    a: Levels4{a:1,b:2,c:3,d:4},
                    b: Levels4{a:5,b:6,c:7,d:8},
                },
                b: Levels3{
                    a: Levels4{a:9,b:10,c:11,d:12},
                    b: Levels4{a:13,b:14,c:15,d:16},
                },
            },
            b: Levels2{
                a: Levels3{
                    a: Levels4{a:17,b:18,c:19,d:20},
                    b: Levels4{a:21,b:22,c:23,d:24},
                },
                b: Levels3{
                    a: Levels4{a:25,b:26,c:27,d:28},
                    b: Levels4{a:29,b:30,c:31,d:32},
                },
            },
        };
    }

    receive() {
        self.val = self.val;
    }
}