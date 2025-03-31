contract A(param: Int) {
    // Contract with parameter, no init() allowed
    receive() {}
}

contract Main {
    receive() {
         // Valid: Using initOf with trailing comma in parameters
         let pkg1 = initOf A(789,);
         let pkg2 = initOf A(789);
    }
}
