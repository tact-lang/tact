struct Sample { a: Int }

contract DuplicateNames {
    sample1: Sample;
    sample2: Sample;

    init() {
        self.sample1 = Sample{ a:1 };
        self.sample2 = Sample{ a:2 };
    }
}