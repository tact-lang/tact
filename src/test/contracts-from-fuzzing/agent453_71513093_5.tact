struct Layer3 { done: Bool; val3:Int }

struct Layer2 {
    flag2: Bool;
    data3: Layer3;
}

struct Layer1 {
    flag: Bool;
    data2: Layer2;
}

contract TestContract {
    persistent: Layer1;

    init() {
        self.persistent = Layer1{
            flag: true,
            data2: Layer2{
                flag2: false,
                data3: Layer3{
                    done: true,
                    val3: 15
                }
            }
        };
    }
}