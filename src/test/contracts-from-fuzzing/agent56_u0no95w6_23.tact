struct Inner1 { v: Int }
struct Inner2 { nested: Inner1 }
struct Inner3 { nested: Inner2 }
struct Inner4 { nested: Inner3 }
struct Inner5 { nested: Inner4 }

contract VeryDeepNested {
    data: Inner5;
    init() {
        self.data = Inner5{
            nested: Inner4{
                nested: Inner3{
                    nested: Inner2{
                        nested: Inner1{
                            v: 7
                        }
                    }
                }
            }
        };
    }
}