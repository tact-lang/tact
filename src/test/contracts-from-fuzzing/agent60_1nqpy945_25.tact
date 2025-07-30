// extremely deep nesting
struct Nested1 { x: Int }
struct Nested2 { x: Nested1 }
struct Nested3 { x: Nested2 }
struct Nested4 { x: Nested3 }
struct Nested5 { x: Nested4 }
struct Nested6 { x: Nested5 }
struct Nested7 { x: Nested6 }
struct Nested8 { x: Nested7 }
struct Nested9 { x: Nested8 }
struct Nested10 { x: Nested9 }

contract TestContract {
    field: Nested10;

    init() {
        self.field = Nested10{ x: Nested9{ x: Nested8{ x: Nested7{ x: Nested6{ x: Nested5{ x: Nested4{ x: Nested3{ x: Nested2{ x: Nested1{ x: 99 } } } } } } } } } };
    }
}