struct DefaultOptionals {
    val1: Int?;
    val2: Int? = null;
    val3: Int? = 3;
    val4: Int?;
}

contract TestContract {
    data: DefaultOptionals;

    init() {
        self.data = DefaultOptionals{ val1:null, val2:null, val3:3, val4:4 };
    }
}