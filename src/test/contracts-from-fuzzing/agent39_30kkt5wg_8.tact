struct ManyOptions {
    A: Int?;
    B: Int?;
    C: Int?;
    D: Int?;
    E: Int?;
    F: Int?;
    G: Int?;
    H: Int?;
    I: Int?;
    J: Int?;
}

contract TestManyOptions {
    receive() {
        // Create an instance of ManyOptions with alternate fields set
        let opts: ManyOptions = ManyOptions {
            A: 1,
            B: null,
            C: 3,
            D: null,
            E: 5,
            F: null,
            G: 7,
            H: null,
            I: 9,
            J: 10
        };

        // Dump only non-null fields using non-null assertion if they are not null
        if (opts.A != null) { dump(opts.A!!); }
        if (opts.C != null) { dump(opts.C!!); }
        if (opts.E != null) { dump(opts.E!!); }
        if (opts.G != null) { dump(opts.G!!); }
        if (opts.I != null) { dump(opts.I!!); }
        if (opts.J != null) { dump(opts.J!!); }
    }
}
