// test mutually nested structs multiple levels
struct Alpha { beta: Beta; }
struct Beta { gamma: Gamma; }
struct Gamma { val: Int; }

contract TestContract {
    data: Alpha;
    init() {
        self.data = Alpha { beta: Beta { gamma: Gamma { val: 42 } } };
    }
}