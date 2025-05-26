contract ComparisonsTester {
    receive() {}

    get fun compare1(input: Int): Bool {
        return input.inc() == input.inc();
    }

    get fun compare2(input: Int): Bool {
        return input.inc() == input.dec();
    }

    get fun compare3(input: Int): Bool {
        //           ^^^^^ 10
        return input.incOld() == input.dec();
        //     ^^^^^^^^^^^^^^    ^^^^^^^^^^^
        //     10, input=11      10
    }
}

extends mutates fun inc(self: Int): Int { self += 1; return self }
extends mutates fun dec(self: Int): Int { self -= 1; return self }
extends mutates fun incOld(self: Int): Int { self += 1; return self - 1 }
