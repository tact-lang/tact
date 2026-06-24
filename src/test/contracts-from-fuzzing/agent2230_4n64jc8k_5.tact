struct Container1 { a: Int; }
struct Container2 { b: Container1; }
struct Container3 { c: Container2; }
struct Container4 { d: Container3; }

contract DeepNestContract {
    data: Container4;

    init() {
        self.data = Container4{
            d: Container3{
                c: Container2{
                    b: Container1{ a: 99 }
                }
            }
        };
    }
}