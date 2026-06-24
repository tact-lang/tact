struct Nested {
    first: Int;
    second: Bool?;
    third: String;
}

struct Container {
    inner: Nested;
    title: String?;
    flag: Bool;
}

contract TestContract {
    payload: Container = Container{
        inner: Nested{first: 1, second: null, third: "abc"},
        title: null,
        flag: true
    };

    init() {
        self.payload = Container{
            inner: Nested{first: 2, second: true, third: "xyz"},
            title: "done",
            flag: false
        };
    }
    receive() {}
}