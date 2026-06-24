// Use only contract params, include nested optional composite param type
struct Bag {
    flag: Bool?;
}

contract Foo(
    name: String?,
    bag: Bag?,
) {
    receive() {
        let _ = self.name;
        let _ = self.bag;
    }
}
