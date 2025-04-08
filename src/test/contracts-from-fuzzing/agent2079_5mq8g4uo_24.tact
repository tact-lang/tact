// Optionals for nested structs
struct Child { x: Int }
struct Parent { child: Child?; name: String }

contract TestContract {
    data: Parent;
    init() {
        self.data = Parent{child: null, name: "hello"};
    }
}