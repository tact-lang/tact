struct L5 { a: Int }
struct L4 { field: L5 }
struct L3 { field: L4 }
struct L2 { field: L3 }
struct L1 { field: L2 }

contract NestedTest1 {
    receive() {
        // Using explicit constructor syntax for deeply nested structure
        let instance: L1 = L1{ field: L2{ field: L3{ field: L4{ field: L5{ a: 42 } } } } };
    }
}
