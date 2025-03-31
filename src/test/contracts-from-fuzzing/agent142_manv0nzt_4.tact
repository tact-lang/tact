contract A {
    receive() {}
}

contract B {
    // Extract the code from initOf A() which returns a StateInit struct
    get fun getInitCode(): Cell {
        let initPkg = initOf A();
        return initPkg.code;
    }

    // Extract the data from initOf A()
    get fun getInitData(): Cell {
        let initPkg = initOf A();
        return initPkg.data;
    }

    // Return only the contract code of A
    get fun getCode(): Cell {
        return codeOf A;
    }

    receive() {}
}
