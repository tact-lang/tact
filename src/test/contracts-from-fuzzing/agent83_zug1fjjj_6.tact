contract ExplicitInitTest {
    var: Int;

    init(x: Int) {
        self.var = x;
    }

    receive() {
        // Using initOf with an explicit init() function
        let s: StateInit = initOf ExplicitInitTest(123);
        // Access fields to ensure they are present
        let _ = s.code;
        let _ = s.data;
    }
}
