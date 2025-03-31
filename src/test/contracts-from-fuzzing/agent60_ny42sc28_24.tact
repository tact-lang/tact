struct Inner {
    i: Int;
}

struct Outer {
    inner: Inner;
    x: Int;
}

// Assembly function that adds two integers
asm fun asmAdd(a: Int, b: Int): Int { ADD }

contract CombinatorialFuzz {
    // Function that calls the asmAdd assembly function
    fun assemblyTest(): Int {
       return asmAdd(15, 27)  // expected result: 15 + 27 = 42
    }

    // Function that destructures a nested struct
    fun destructureNested(o: Outer): Int {
       let Outer { inner, x } = o;
       let Inner { i } = inner;
       // Return combined: 100 * i + x
       return 100 * i + x
    }

    // Getter using compile-time functions: ascii and crc32
    get fun getConstants(): Int {
       let a: Int = ascii("TEST");
       let c: Int = crc32("TEST");
       return a + c
    }

    // Function to test nested destructuring
    fun nestedDestructureTest(): Int {
       let o: Outer = Outer { inner: Inner { i: 3 }, x: 7 };
       return self.destructureNested(o)  // expected: 100 * 3 + 7 = 307
    }

    // Getter that aggregates results from various tests
    get fun aggregate(): Int {
       let addRes: Int = self.assemblyTest();
       let destrRes: Int = self.nestedDestructureTest();
       let consts: Int = self.getConstants();
       return addRes + destrRes + consts
    }

    // Persistent state variable, initialized
    s: Int = 0;

    // Receiver: if message is non-empty, add assemblyTest() to state variable s
    receive(msg: String) {
         if (msg != "") {
              self.s = self.s + self.assemblyTest()
         }
    }

    // Getter to expose state variable s
    get fun getState(): Int {
         return self.s
    }
}
