struct DeeplyNestedStruct {
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
}

struct Inner2 {
    inner3: Inner3;
}

struct Inner3 {
    value: Int;
}

contract VeryDeep {
    storage: DeeplyNestedStruct;
    init() {
        self.storage = DeeplyNestedStruct{
            inner1: Inner1{
                inner2: Inner2{
                    inner3: Inner3{
                        value: 99
                    }
                }
            }
        };
    }
    receive() {
        let _ = self.storage.inner1.inner2.inner3.value;
    }
}