struct DefaultOptTest {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract DefaultOptStructField {
    nest: DefaultOptTest;

    init() {
        self.nest = DefaultOptTest{
            a: null,
            b: null,
            c: null,
        };
    }
}