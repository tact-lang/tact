contract TestStringBuilder {
    receive() {
        let sb: StringBuilder = beginString();
        sb.append("Hello");
        sb.append(", ");
        sb.append("Tact!");
        let finalString: String = sb.toString();
        emit(finalString.asComment());
    }
}