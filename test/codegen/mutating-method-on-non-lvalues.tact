struct Foo { x : Int }

extends mutates fun inc(self: Int) { self += 1 }

const GlobalConst: Int = 42;

contract MutatingMethodOnNonLvalues {
    const ContractConst: Int = 43;

    receive("foo") {
        41.inc();
        GlobalConst.inc();
        self.ContractConst.inc();
        Foo {x: 44}.x.inc();
    }
}

