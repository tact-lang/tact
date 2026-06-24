struct Child { flag: Bool }

contract ManyLevels {
    a: Child;
    b: Child?;

    init() {
        self.a = Child{ flag:true };
        self.b = null;
    }
}