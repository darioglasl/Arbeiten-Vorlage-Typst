#import "../Helpers/code-snippets.typ": code

== Unit Tests <headingUnitTests>
TODO: text

#figure(
  code(
    stepnumber:1,
    numberfirstline: true,
    numbers: true,
		firstnumber: 138,
    caption: "DateUtilsTest.java"
  )[```java
	@Test
  void monthsBetweenDates_whenDifferentYear_thenTwoMonths() {
    // given
    var fromDate = LocalDate.parse("2021-12-01");
    var toDate = LocalDate.parse("2022-01-28");
    var expected = List.of(12, 1);

    // when
    var result = DateUtils.getMonthsBetweenDates(fromDate, toDate);

    // then
    assertEquals(expected, result);
  }
  ```],
  caption: [Unit Test für `DateUtils.getMonthsBetweenDates`],
  kind: "Code-Fragment",
  supplement: [Code-Fragment]
) <codeUnitTestExample>