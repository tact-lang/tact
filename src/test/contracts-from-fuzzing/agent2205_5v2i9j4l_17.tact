struct Wrapper {
  val: Int?;
}

contract OptNilInit {
    data: Wrapper;

    init() {
        self.data = Wrapper{ val: null };
    }
}