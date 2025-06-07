struct S { xs: map<Int, Int> }

contract TestContract {
    m: map<Int, S>;

    init() {
        self.m = emptyMap();
    }
}