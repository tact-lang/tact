struct Mix {
    a: Int;
    b: Int?;
    c: Int? = null;
}

contract TestContract {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1,
            b: null,
            c: null
        };
    }
}