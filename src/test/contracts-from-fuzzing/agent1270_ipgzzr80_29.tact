struct DeepNested {
    i1: Inner1;
    i2: Inner2;
    optI3: Inner3?;
}

struct Inner1 { x: Int }
struct Inner2 { y: Bool }
struct Inner3 { z: String }

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            i1: Inner1{x:10},
            i2: Inner2{y:false},
            optI3: null
        };
    }
}