struct Defaulted {
   x: Int = 5;
   y: Bool = true;
   z: String = "hello";
}

contract TestContract {
    df: Defaulted;

    init() {
        self.df = Defaulted{};
    }
}