struct Nest1 {
    x: Int;
}
struct Nest2 {
    y: Nest1;
}
struct Nest3 {
    z: Nest2;
}
struct Nest4 {
    w: Nest3;
}

contract VeryDeepNest {
    payload: Nest4;

    init() {
        self.payload = Nest4{
            w: Nest3{
                z: Nest2{
                    y: Nest1{
                        x: 999
                    }
                }
            }
        };
    }
}