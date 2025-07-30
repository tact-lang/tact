contract ParamContract(param: Int) {
    // No explicit init function because parameters are used
    receive() {
         // Using initOf with a contract that uses contract parameters
         let s: StateInit = initOf ParamContract(100);
         // Access code and data fields
         let _ = s.code;
         let _ = s.data;
    }
}
