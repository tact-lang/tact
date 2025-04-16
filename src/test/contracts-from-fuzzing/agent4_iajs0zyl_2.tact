contract Simple {} 

contract Test1 {
    receive() {
        // Valid usage: Simple has an implicit empty init()
        let initState = initOf Simple();
        let simpleCode = codeOf Simple;
        
        // Compare the code in initState with the code obtained by codeOf
        let same = initState.code == simpleCode;
    }
}
