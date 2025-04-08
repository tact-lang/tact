struct T1 { a: Int; }
struct T2 { t1: T1; b: String; }
struct T3 { t2: T2; c: Bool; }
struct T4 { t3: T3; d: Int?; }
struct T5 { t4: T4; e: String?; }

contract TestContract {
    x: T5;

    init() {
        self.x = T5{
            t4: T4{
                t3: T3{
                    t2: T2{
                        t1: T1{ a: 0 },
                        b: ""
                    },
                    c: false
                },
                d: null
            },
            e: null
        };
    }

    receive() {
        self.x = T5{
            t4: T4{
                t3: T3{
                    t2: T2{
                        t1: T1{ a: 42 },
                        b: "deep"
                    },
                    c: true
                },
                d: 777
            },
            e: "updated"
        };
    }
}