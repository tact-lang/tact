struct Mixed {
    x: Int;
    y: String?;
    z: Bool;
}

struct Wrapper {
    val1: Mixed;
    val2: Int;
    val3: Mixed;
}

contract MultiNested {
    payload: Wrapper;

    init() {
        self.payload = Wrapper{
            val1: Mixed{ x:1, y:null, z:false },
            val2: 5,
            val3: Mixed{ x:2, y:"hi", z:true }
        };
    }
}