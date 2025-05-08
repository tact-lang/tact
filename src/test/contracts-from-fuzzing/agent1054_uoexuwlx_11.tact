contract TestContract {
    deeplyNested: A;

    init() {
        self.deeplyNested = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            val: 42
                        }
                    }
                }
            }
        };
    }
}

struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { e: E; }
struct E { val: Int; }