contract B(param: Int) {
    receive() {}
}

contract TesterB {
    receive() {}
    
    get fun test(): Bool {
        let pkg = initOf B(7);
        return codeOf B == pkg.code;
    }
}
