const GLOBAL_ERROR_VOTING_ENDED: String = "Voting has ended!";

contract Test {
    const ERROR_VOTING_ENDED: String = "Voting has ended";

    receive() {}

    receive("self constant") {
        require(false, self.ERROR_VOTING_ENDED);
    }

    receive("global constant") {
        require(false, GLOBAL_ERROR_VOTING_ENDED);
    }
}
