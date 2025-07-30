// Test B: Valid usage in struct destructuring assignment

struct Two { 
    first: Int;
    second: String;
}

fun f(t: Two): Int {
    let Two { first, second: _ } = t;
    return first;
}

contract Test {
    receive() {
         dump(f(Two { first: 10, second: "hello" }));
    }
}
