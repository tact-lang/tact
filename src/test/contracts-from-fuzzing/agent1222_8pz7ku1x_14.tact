struct SimArray {
    val1: Int = 1;
    val2: Int = 2;
    val3: Int = 3;
    val4: Int = 4;
    val5: Int = 5;
}

contract TestContract {
    arr: SimArray;

    init() {
        self.arr = SimArray{
            val2: 22,
            val4: 44,
            // others default
        };
    }

    receive() {
        let sum = self.arr.val1 + self.arr.val2 + self.arr.val3 + self.arr.val4 + self.arr.val5;
    }
}