struct Nest1 { a: Int }
struct Nest2 { b: Nest1 }
struct Nest3 { c: Nest2 }
struct Nest4 { d: Nest3 }
struct Nest5 { e: Nest4 }
struct Nest6 { f: Nest5 }

contract Test {
    deep: Nest6;

    init() {
        self.deep = Nest6{ f: Nest5{ e: Nest4{ d: Nest3{ c: Nest2{ b: Nest1{ a: 1 } } } } } };
    }
}