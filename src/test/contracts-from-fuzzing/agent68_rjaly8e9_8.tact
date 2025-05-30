contract TesterCurrent {
    receive() {}
    
    get fun getMyCode(): Cell {
         return codeOf TesterCurrent;
    }
}
