///////////////////////////////////////////////////////////////
// Aggregated Advanced Fuzz Testing: Destructuring, Nested Structs, and Contract State
///////////////////////////////////////////////////////////////

// Test: Basic geometric structs and Manhattan distance calculation
struct Point {
    x: Int;
    y: Int;
}

struct Line {
    p1: Point;
    p2: Point;
}

fun test_line_length() : Int {
    let l = Line { p1: Point { x: 3, y: 4 }, p2: Point { x: 6, y: 8 } };
    // Manhattan distance: |3-6| + |4-8| = 3 + 4 = 7
    let dx = (l.p1.x > l.p2.x) ? (l.p1.x - l.p2.x) : (l.p2.x - l.p1.x);
    let dy = (l.p1.y > l.p2.y) ? (l.p1.y - l.p2.y) : (l.p2.y - l.p1.y);
    return dx + dy; // Expected result: 7
}

// Test: Destructuring assignment and field punning
struct Pair {
    first: Int;
    second: String;
}

fun destructuring_test() : Pair {
    // Destructure a Pair instance using field punning
    let Pair { first, second } = Pair { first: 10, second: "hello" };
    // Multiply the first field by 2
    return Pair { first: first * 2, second: second };
}

// Test: Nested destructuring with an optional field
struct Nested {
    a: Int;
    b: Int?;
}

fun nested_destructuring() : Int {
    let Nested { a, b } = Nested { a: 50, b: 25 };
    // Unwrap b using a null-check and non-null assertion operator (!!)
    return a + ((b != null) ? (b!! ) : 0);
}

// Contract Test: Using a struct for persistent state and a getter
struct UserInfo {
    id: Int;
    name: String = "Unknown";
}

contract UserContract {
    user: UserInfo;

    init(u: UserInfo) {
        self.user = u;
    }

    get fun getUser() : UserInfo {
        return self.user;
    }
}

// Aggregator function that combines several tests
struct Triple {
    a: Int;
    b: Int;
    c: Int;
}

fun combined_tests() : Triple {
    return Triple { 
        a: test_line_length(), 
        b: destructuring_test().first, 
        c: nested_destructuring() 
    };
}

// End of aggregated advanced fuzz testing snippet
