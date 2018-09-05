# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rtanque/version'

Gem::Specification.new do |gem|
  gem.name          = "rtanque_core"
  gem.version       = RTanque::VERSION
  gem.authors       = ["Adam Williams"]
  gem.email         = ["pwnfactory@gmail.com"]
  gem.summary       = %q{RTanque is a game for programmers. Players program the brain of a tank and then send their tank into battle against other tanks.}
  gem.description   = %q{RTanque is a game for programmers. Players program the brain of a tank and then send their tank+brain into battle with other tanks. All tanks are otherwise equal.

Rules of the game are simple: Last bot standing wins. Gameplay is also pretty simple. Each tank has a base, turret and radar, each of which rotate independently. The base moves the tank, the turret has a gun mounted to it which can fire at other tanks, and the radar detects other tanks in its field of vision.

Have fun competing against friends' tanks or the sample ones included. Maybe you'll start a small league at your local Ruby meetup.

This gem provides the core without gui, for that you'll need rtanque_gui.
}
  gem.homepage      = "https://github.com/devscola/RTanque_core"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'octokit', '~> 2.7.0'
  gem.add_dependency 'thor', '~> 0.17.0'
  # gem.add_dependency 'faye-websocket', '~> 0.10.7'
  # gem.add_dependency 'thin', '~> 1.7.2'

  gem.add_development_dependency 'rspec', '~> 3.6'
  gem.add_development_dependency 'rspec-mocks', '~> 3.6'
end
