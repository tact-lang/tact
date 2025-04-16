fun dumpTest() {
    dump("Hello world!");
    dump(123); // this comment is not included in the output
    dump(true); /* this comment is not included in the output */
    dump(false);
    dump(null);
    dump(myAddress());
    let address: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    dump(address);
    dump(ascii("Tact"));
    let maybeBool1: Bool? = null;
    let maybeBool2: Bool? = true;
    let maybeBool3: Bool? = false;
    dump(maybeBool1);
    dump(maybeBool2);
    dump(maybeBool3);
    let emptyIntIntMap: map<Int, Int> = emptyMap();
    dump(emptyIntIntMap);
    let maybeAddress1: Address? = null;
    let maybeAddress2: Address? = address;
    dump(maybeAddress1);
    dump(maybeAddress2);
    let maybeString1 : String? = null;
    let maybeString2 : String? = "Hello world!";
    dump(maybeString1);
    dump(maybeString2);
    let maybeInt1 : Int? = null;
    let maybeInt2 : Int? = 42;
    dump(maybeInt1);
    dump(maybeInt2);
    let maybeBuilder1 : Builder? = null;
    let maybeBuilder2 : Builder? = beginCell().storeBool(true);
    dump(maybeBuilder1);
    dump(maybeBuilder2);
    let maybeCell1 : Cell? = null;
    let maybeCell2 : Cell? = beginCell().storeBool(true).endCell();
    dump(maybeCell1);
    dump(maybeCell2);
    let maybeSlice1 : Slice? = null;
    let maybeSlice2 : Slice? = beginCell().storeBool(true).endCell().beginParse();
    dump(maybeSlice1);
    dump(maybeSlice2);
}

contract Tester() {
    receive() {} // deploy

    receive("Dump") {
        dumpTest();
    }

    get fun dump() {
        dumpTest();
    }
}
