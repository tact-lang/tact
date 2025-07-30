// Contract with large chain of nested optional structs
struct DeepNest5 { val: Int = 5; }
struct DeepNest4 { next: DeepNest5?; }
struct DeepNest3 { next: DeepNest4?; }
struct DeepNest2 { next: DeepNest3?; }
struct DeepNest1 { next: DeepNest2?; }

contract TestContract {
    field: DeepNest1 = DeepNest1{
        next: DeepNest2{
            next: DeepNest3{
                next: DeepNest4{
                    next: DeepNest5{val: 123}
                }
            }
        }
    };

    init() {
        self.field = DeepNest1{next: null};
    }

    receive() {
        let _ = self.field.next;
    }
}