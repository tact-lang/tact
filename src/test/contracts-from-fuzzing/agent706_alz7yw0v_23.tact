struct Mix {
    foo: Int;
    bar: String;
}

contract TestContract {
    first: Mix;
    second: Mix;

    init() {
        self.first = Mix{foo: 1, bar: "one"};
        self.second = Mix{foo: 2, bar: "two"};
    }
}