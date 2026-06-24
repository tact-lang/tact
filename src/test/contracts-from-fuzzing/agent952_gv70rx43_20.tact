contract MixedOpts {
    ai: Int?;
    bi: Int = 5;
    ci: Int? = null;
    di: Int;

    init() {
        self.ai = null;
        self.bi = 10;
        self.ci = 20;
        self.di = 30;
    }
}
