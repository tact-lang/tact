struct Persistence {
    a: Int;
    b: String?;
    c: Int;
}

contract PersistTest {
    data: Persistence;

    init() {
        self.data = Persistence{ a:1, b:null, c:2 };
    }

    receive() {
        self.data = self.data;
    }
}