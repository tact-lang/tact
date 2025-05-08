struct Defaulted {
    x: Int = 10;
    y: Bool = false;
}

contract DefaultsOpt {
    data: Defaulted?;
    
    init() {
        self.data = Defaulted{}; // omit both since they are defaulted
    }
}