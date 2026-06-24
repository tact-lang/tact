struct DeepNested {
    lvl1: Inner1;
}

struct Inner1 {
    lvl2: Inner2;
}

struct Inner2 {
    lvl3: Inner3;
}

struct Inner3 {
    lvl4: Inner4;
}

struct Inner4 {
    val: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            lvl1: Inner1{
                lvl2: Inner2{
                    lvl3: Inner3{
                        lvl4: Inner4{ val: 42 }
                    }
                }
            }
        };
    }
}