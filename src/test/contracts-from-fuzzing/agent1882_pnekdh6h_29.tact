struct WithEmptyDefault {
  s: String = "";
}

contract EmptyString(
  data: WithEmptyDefault
) {}