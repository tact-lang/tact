// test struct with trailing optional and remaining slice
struct Mix {
  a: Int;
  b: Bool?;
  c: Slice as remaining;
}

contract TestContract {
    data: Mix;
    init() {
        self.data = Mix{
            a: 7,
            b: null,
            c: emptyCell().asSlice()
        };
    }
}