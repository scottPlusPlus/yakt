package test;

import utest.ui.Report;
import utest.Assert;
import utest.Async;
import utest.Runner;

class Test {
	public static function main() {
		var runner = new Runner();
		runner.addCases(yakt_test);
		Report.create(runner);
		runner.run();
	}
}
