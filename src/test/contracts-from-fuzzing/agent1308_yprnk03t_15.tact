struct Base {
    i: Int;
    s: String;
}

struct Wrapper {
    main: Base?;
    fallback: Base?;
    label: String?;
}

contract TestContract {
    val: Wrapper;

    init() {
        self.val = Wrapper {
            main: null,
            fallback: null,
            label: null
        };
    }
}